# ---- שלב 1: Build ----
FROM node:20-alpine AS build
WORKDIR /app

# התקנת תלויות
COPY package*.json ./
RUN npm ci

# העתקת קוד ובנייה
COPY . .
RUN npm run build

# ---- שלב 2: Serve ב-Nginx ----
FROM nginx:alpine

# קובץ קונפיגורציה ל-SPA
COPY nginx.conf /etc/nginx/nginx.conf

# העתקת פלט ה-build
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]