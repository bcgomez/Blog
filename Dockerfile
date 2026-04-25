# Stage 1: Build the Astro app
FROM node:22-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine
# Eliminar la configuración base de Nginx
RUN rm /etc/nginx/conf.d/default.conf
# Copiar nuestra configuración personalizada
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Copiar los estáticos construidos desde la etapa anterior
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]