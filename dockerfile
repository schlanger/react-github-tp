# Utilisation d'une image Node.js officielle
FROM node:18 AS build

# Définition du répertoire de travail
WORKDIR /app

# Copier uniquement les fichiers nécessaires pour l'installation des dépendances
COPY package.json package-lock.json ./

# Installation des dépendances
RUN npm install

# Copier le reste du projet
COPY . .

# Construire l'application React en production
RUN npm run build

FROM node:18

# Installer `serve` globalement pour servir l'application React
RUN npm install -g serve

WORKDIR /app

COPY --from=build /app/build .

# Exposer le port sur lequel l'application tournera
EXPOSE 3000

# Démarrer l'application avec `serve`
CMD ["serve", "-s", ".", "-l", "3000"]
