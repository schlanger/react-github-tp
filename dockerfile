# Utilisation d'une image Node.js officielle (adapter si nécessaire)
FROM node:18

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers package.json et package-lock.json
COPY package*.json ./

# Installation des dépendances
RUN npm install

# Copie du reste du projet
COPY . .

# Exposition du port utilisé par l'application (ex: 3000)
EXPOSE 3000

# Commande de démarrage de l'application
CMD ["npm", "start"]
