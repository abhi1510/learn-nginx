FROM node:12
WORKDIR /app
COPY ./app .
RUN npm install
CMD ["node", "index.js"]
EXPOSE 9999

# Create image: docker build -t nodeapp . 
# Run container: docker run --name nodeapp -p 9999:9999 nodeapp 