# 1. Use a modern, supported base image like Debian Bookworm
FROM python:3.10-slim-bookworm

# 2. Combine all system package installations into a single RUN command.
#    This creates a single layer and is more efficient.
#    - `apt-get clean` and `rm -rf /var/lib/apt/lists/*` cleans up afterward to reduce image size.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        ffmpeg \
        wget \
        bash \
        neofetch \
        software-properties-common \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# 3. Copy only the requirements file first.
#    This leverages Docker's layer caching. The requirements will only be re-installed
#    if the requirements.txt file changes.
COPY requirements.txt .

# 4. Install Python packages.
#    - The `wheel` package is installed automatically by pip when needed.
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code into the image.
#    Because this is the last step, changes to your code won't trigger a reinstall
#    of all the system packages and Python requirements, making builds much faster.
COPY . .

# Expose the port your application will run on
EXPOSE 8000

# The command to run your application
CMD flask run -h 0.0.0.0 -p 8000 & python3 -m devgagan
