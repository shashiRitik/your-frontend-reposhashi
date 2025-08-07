# Step 1: Build frontend
FROM node:21 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# RUN echo "=== Check build folder ===" && ls -la /app && ls -la /app/build

# Step 2: Serve with nginx
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
