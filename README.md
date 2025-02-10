# 🚀 Nuxt 3 Project Setup Script

This Bash script automates the setup of a **Nuxt 3** project with **Tailwind CSS** and **Pinia** state management.  
It ensures the required tools are installed, asks for user preferences, and sets up everything automatically.  

## 🛠️ Features
✅ Checks if **npm** and **pnpm** are installed (installs pnpm if missing)  
✅ Asks for the **project name** (default: `my-nuxt-app`)  
✅ Option to create the project in the **current directory** or a new folder  
✅ Lets you **choose between pnpm or npm** as the package manager  
✅ Installs **Nuxt 3, Tailwind CSS, and Pinia**  
✅ Configures **Tailwind CSS & Nuxt settings** automatically  

## 📥 Installation & Usage
### 1️⃣ **Download & Make Executable**
```
git clone https://github.com/astratow/nuxt-starter.git
cd nuxt-starter
chmod +x start-nuxt.sh
```
2️⃣ Run the Script
```
./start-nuxt.sh
```
🔧 What the Script Does

1️⃣ Asks for the project name (default: window-quote-app)

2️⃣ Asks if you want to create the project in the current directory

3️⃣ Checks & installs pnpm if missing

4️⃣ Lets you choose between pnpm or npm

5️⃣ Runs nuxi init to create the Nuxt 3 project

6️⃣ Installs dependencies (Nuxt 3, Tailwind CSS, Pinia)

7️⃣ Configures Tailwind CSS automatically

8️⃣ Sets up nuxt.config.ts with Tailwind & Pinia

🚀 Running the Project
Once setup is complete, run:

bash
```
pnpm run dev  # or npm run dev if chosen
```
This will start a development server on localhost:3000.

🛠️ Troubleshooting
pnpm Not Found in Git Bash?
If pnpm is installed but not found in Git Bash, add it to your PATH:

bash
```
echo 'export PATH="$PATH:/c/Users/YourUser/AppData/Local/pnpm"' >> ~/.bashrc
source ~/.bashrc
```
Or enable corepack:

bash
```
corepack enable
corepack prepare pnpm@latest --activate
```
