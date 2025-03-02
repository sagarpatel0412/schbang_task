### SchBang Task
```md
# 🚀 Next.js + Prisma + PostgreSQL Setup Guide

## 📌 Prerequisites
Before you begin, ensure you have the following installed:
- [Node.js](https://nodejs.org/) (LTS version recommended)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Prisma](https://www.prisma.io/)
- [pnpm](https://pnpm.io/) or `npm`/`yarn` for package management

---

## 📂 **1️⃣ Project Setup**
Clone the repository and install dependencies:

```sh
git clone https://github.com/sagarpatel0412/schbang_task.git
cd schbang_task
npm install
```

---

## 🛠 **2️⃣ Database Setup**
### 📥 Import SQL File into PostgreSQL
1. **Start PostgreSQL** on your machine.
2. **Create a new database** in PostgreSQL:
   ```sh
   psql -U postgres
   ```
   Then run:
   ```sql
   CREATE DATABASE your_database_name;
   ```

3. **Import the SQL file** into PostgreSQL:
   ```sh
   pg_restore -U postgres -d your_database -p 5432 db_backup.sql
   ```
   > 🔹 Replace `your_database_name` with your actual database name.

---

## 🔧 **3️⃣ Configure Prisma**
1. Copy the `.env.example` file and rename it to `.env`:
   ```sh
   cp .env.example .env
   ```
2. Open `.env` and set your PostgreSQL connection string:
   ```env
   DATABASE_URL="postgresql://your_username:your_password@localhost:5432/your_database_name"
   ```

3. Push the database schema to Prisma:
   ```sh
   npx prisma db push
   ```

4. Generate Prisma Client:
   ```sh
   npx prisma generate
   ```

---

## 🚀 **4️⃣ Start the Next.js Application**
Run the development server:
```sh
npm run dev  # or npm run dev / yarn dev
```
The app will be available at:
```sh
http://localhost:3000
```

---

## 🛠 **5️⃣ Prisma Studio (Optional)**
To explore your database visually:
```sh
npx prisma studio
```

---

## 🐞 **Troubleshooting**
### **1. Error: `relation "table_name" does not exist`**
- Ensure you've imported the SQL file correctly.
- Run `npx prisma db push` to sync Prisma with your database.

### **2. PostgreSQL Authentication Error**
- Check your `.env` file and ensure your **PostgreSQL credentials are correct**.
- Restart PostgreSQL and try again.

### **3. Prisma Client Not Found**
- Run:
  ```sh
  npx prisma generate
  ```
---
## Contact
Created by [@sagarpatel0412](https://github.com/sagarpatel0412) - feel free to contact me!
