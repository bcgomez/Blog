#!/bin/bash

# Detener el script si hay un error
set -e

echo "🚀 Iniciando despliegue de Astro Web App y Stack de Monitoreo..."
echo "----------------------------------------------------------------"

echo "🧹 [1/3] Limpiando infraestructura anterior (si existe)..."
sudo docker compose down

echo "🏗️  [2/3] Construyendo contenedores (esto puede tomar varios segundos)..."
sudo docker compose build --no-cache webapp

echo "🚀 [3/3] Levantando los microservicios en background..."
sudo docker compose up -d

echo "----------------------------------------------------------------"
echo "✅ ¡Despliegue automatizado finalizado con éxito!"
echo ""
echo "Podrás acceder a tus servicios en las siguientes URLs:"
echo "👉 Web App (Astro):   http://localhost:8080"
echo "👉 Panel Prometheus:  http://localhost:9090"
echo "👉 Panel Grafana:     http://localhost:3000"
echo ""
echo "Para observar los logs en tiempo real, puedes usar: sudo docker compose logs -f"