# Kali Backend Project 📝

# Kali Backend Project 📝  

This project includes:

* Kali Mobile App business logic
* Kali Founders business logic
  
## Kali Mobile App  🚀  

To get started, hit the 'clear' button at the top of the editor!  

* user steps track
* Points Calculation
* shopping cart
  * Buy products


## Kali Founders

* Founder Management
  * Shops management
  * Products management
    * Register/Enable/Desable products to sale
    * Product Inventory Updates
    * Purchase Order
      * Products checkout

# Local development 🔥

## Supabase Install

### Installation docs

[https://supabase.com/docs/guides/cli/getting-started?queryGroups=platform&platform=linux](https://supabase.com/docs/guides/cli/getting-started?queryGroups=platform&platform=linux)

### Dev environment setup

  If using [nvm](https://github.com/nvm-sh/nvm), make sure to use the correct node version.
  You'll also need to install [Docker desktop](https://www.docker.com/products/docker-desktop/) to run the local Supabase instance.

  ```sh
  nvm use
  ```
  
  Then clone the repository and install the dependencies.
  
  ```sh
  git clone git@github.com:jeanc18rlos/kali-supabase-backend.git
  npm i # or npm install, install dependencies
  npx supabase start
  ```

  To view local supabase instance info:
  
  ```sh
  npx supabase status
  ```

  To stop the supabase instance:

  ```sh
  npx supabase stop
  ```

### Open Supabase Studio (Web Admin)

  ```sh
    http://localhost:54323
  ```

## Architecture diagram

![backend architecture](./docs/images/Architecture/kali-backend-architecture.drawio.svg)  

## Database ER diagram

### App Schema

![app schema](./docs/images/DB/kali%20DB-%20app%20schema.png)  

### Shop Schema

![shop schema](./docs/images/DB/Kali%20DB%20-%20shop%20schema.png)
