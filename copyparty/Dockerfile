FROM python:3.11-alpine

# Install dependencies
RUN apk add --no-cache \
    git \
    && rm -rf /var/cache/apk/*

# Create user
RUN addgroup -g 1000 copyparty \
    && adduser -D -u 1000 -G copyparty copyparty

# Install copyparty
RUN git clone https://github.com/9001/copyparty.git /opt/copyparty \
    && cd /opt/copyparty \
    && pip install .

# Set working directory
WORKDIR /opt/copyparty

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh && \
    chown copyparty:copyparty /run.sh

# Expose port
EXPOSE 8080

# Switch to user
USER copyparty

# Run copyparty
CMD ["/run.sh"]