# Build phase
FROM node:14 as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx
# Doing copy from build phase
COPY --from=builder /app/build /user/share/nginx/html 

