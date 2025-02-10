#!/bin/bash

echo "🚀 Welcome to the Nuxt 3 Project Setup Script!"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if npm is installed
if ! command_exists npm; then
    echo "❌ npm is not installed! Please install Node.js before running this script."
    exit 1
fi

# Check if pnpm is installed, install if missing
if ! command_exists pnpm; then
    echo "⚠️ pnpm is not installed. Installing pnpm globally..."
    npm install -g pnpm
    if ! command_exists pnpm; then
        echo "❌ Failed to install pnpm. Exiting..."
        exit 1
    fi
fi

# Ask user for package manager preference
echo "🔹 Select a package manager:"
echo "   1) pnpm (recommended - faster, less disk space)"
echo "   2) npm"
read -p "Enter choice (1 or 2): " PM_CHOICE

if [[ "$PM_CHOICE" == "1" ]]; then
    PACKAGE_MANAGER="pnpm"
elif [[ "$PM_CHOICE" == "2" ]]; then
    PACKAGE_MANAGER="npm"
else
    echo "⚠️ Invalid choice. Defaulting to pnpm."
    PACKAGE_MANAGER="pnpm"
fi

# Ask for project name
read -p "Enter project name (leave empty for 'window-quote-app'): " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-window-quote-app}

# Ask whether to create in the current directory
read -p "Do you want to create the project in the current directory? (y/n): " CREATE_IN_CURRENT_DIR

if [[ "$CREATE_IN_CURRENT_DIR" =~ ^[Yy]$ ]]; then
    echo "📂 Creating Nuxt 3 project in the current directory..."
    npx nuxi init .
else
    echo "📂 Creating Nuxt 3 project in a new directory: $PROJECT_NAME..."
    npx nuxi init "$PROJECT_NAME"
    cd "$PROJECT_NAME"
fi

echo "📦 Installing dependencies using $PACKAGE_MANAGER..."
$PACKAGE_MANAGER install

echo "🎨 Setting up Tailwind CSS..."
$PACKAGE_MANAGER install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

echo "⚙️ Configuring Tailwind CSS..."
cat > tailwind.config.js <<EOL
export default {
  content: [
    "./app.vue",
    "./components/**/*.{vue,js,ts}",
    "./pages/**/*.{vue,js,ts}",
    "./layouts/**/*.{vue,js,ts}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
EOL

mkdir -p assets/css
cat > assets/css/tailwind.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

echo "⚙️ Configuring Nuxt..."
cat > nuxt.config.ts <<EOL
export default defineNuxtConfig({
  css: ["@/assets/css/tailwind.css"],
  modules: ["@pinia/nuxt"],
});
EOL

echo "📦 Installing Pinia (state management for Vue)..."
$PACKAGE_MANAGER install @pinia/nuxt

echo "✅ Setup complete!"
echo "👉 To start your project, run:"
echo "   $PACKAGE_MANAGER run dev"

