# Use an official Ubuntu base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies, add PufferPanel repo, install PufferPanel
RUN apt-get update && \
    apt-get install -y curl gnupg2 software-properties-common && \
    curl -sSL https://repo.pufferpanel.com/setup.sh | bash && \
    apt-get install -y pufferpanel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose the PufferPanel port
EXPOSE 8080

# Copy entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
