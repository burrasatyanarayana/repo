# Static Website

This is a static website example deployed using Docker and Jenkins.

## Files

- `Dockerfile`: Defines the Docker image using nginx.
- `docker-compose.yml`: Defines the Docker service.
- `index.html`: Main HTML file.
- `styles.css`: Stylesheet for the HTML file.
- `script.js`: JavaScript for the HTML file.

## Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/static-website.git
   cd static-website
   ```

2. Build and run the Docker container:
   ```sh
   docker-compose up --build
   ```

3. Open your browser and navigate to `http://localhost:80` to see the website.

