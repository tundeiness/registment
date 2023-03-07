# REGISTMENT: 
## A Rails Authentication and Authorization CRUD API

> This project is the Server Side solution for an equipment Inventory app called REGISTMENT. The Client Side aspect is a work in progress and it can be found [here](https://github.com/tundeiness)

> This project also uses `gem devise`, `gem cancancan`, `gem devise-jtw` and `JWT Tokens` for Authentication and Authorization.

## 🛠 Built With

- Ruby 2.7.3
- Rails 7.0.4
- PostgreSQL


## 💻 Getting Started

> To get a working local copy, follow these steps listed bellow.

### Prerequisites

In order to run this project you need:

- Visual studio code or your preferred code editor
- Have a basic Knowledge of Ruby-on-Rails and APIs

### Setup

Open your terminal inside your destination folder and run the command bellow to clone this repository to your folder:

```sh
  git clone git@github.com:tundeiness/registment.git
```

or use https

```sh
git clone https://github.com/tundeiness/registment.git
```

Then :

```sh
    cd registment/
```

### Install

Install all gems

```sh
 bundle install
```

Create database

```sh
 rails db:create
```

Run migrations to create all tables

```sh
 rails db:migrate
```

see the database

```sh
 rails db:seed
```

Run the project on your local server

```sh
  rails server
```

Now you can navigate to [http://127.0.0.1:3001](http://127.0.0.1:3001)
inside [Postman](https://www.postman.com/) and enjoy all the end-points

### Testing

- RSpec
- Factory Bot

Run the test in a local server:

```sh
  bundle exec rails spec
```

### Usage

This project is designed for only authorised users, and to run the project, you have to first do the following:

Open [Postman](https://www.postman.com/) and register a new user;

Examples:

- Register a new user
  Request : `POST`
  URL : `http://127.0.0.1:3001/users`
  Body :
  ```json
    {
        "user": {
        "first_name":"Kreemy",
        "last_name":"Althold",
        "email":"kreemyalt@example.com",
        "password":"#123456@",
        "address":"No. 12 Borno way Ebutte-Metta Lagos",
        "phone":"0807-8988-9355"
        }
    }
    ```

  at the project terminal, run `rails console`. At the `irb` prompt, edit the user role created in postman
  By default, the role for a new user is `normal` but to be able to check how other endpoints work, you will
  need a `super_admin` or `admin` user.
  At  rails console you can change the role like below:

  ```rb
    u = User.first
    u.update(role:'super_admin')
    u.save
  ```

  This will change the first users' role to super_admin, and with that you can perform other request
  as long as you are the `super_admin` or `admin users`. Note that only user with super_admin role can
  create other `normal` users and also change role of other users.

- user Sign in
  Request : `POST`
  URL : `http://127.0.0.1:3001/users/sign_in`
  Body :
  ```rb
    {
        "user" : {
            "email":"kreemyalt@example.com",
            "password":"#123456@"
        }
    }
    ```
- user sign out
  Request : `DELETE`
  URL : `http://127.0.0.1:3001/users/sign_out`
  Header : `Copy header form the login`

- Logged in User

  Request : `GET`
  URL : `http://127.0.0.1:3001/logged`


- Get ALl users (super_admin & admin only)

  Request : `GET`
  URL : `http://127.0.0.1:3001/members`



- List all equipment (super_admin & admin only)

  Request : `GET`
  URL : `http://127.0.0.1:3001/api/v1/equipments/`


- Create new equipment (super_admin & admin only)

  Request : `POST`
  URL : `http://127.0.0.1:3001/api/v1/equipments/`
  Body :
  ```json
    {
        "equipment":{
        "brand_name": "Topcon",
        "serial_no": "110Jewx09",
        "condition": "new",
        "date_acquired": "2023-01-01",
        "supplier": "EnvironCon Ltd",
        "model_number": "5633650",
        "description": "American brand GNSS Manufactured in Texas",
        "service_date": ""
        }
    }
    ```

- Update an equipment (super_admin & admin only)
  Request : `PATCH` or `PUT`
  URL : `http://127.0.0.1:3001/api/v1/equipments/:id`
  Body :
  ```json
    {
        "equipment":{
        "id": 2,
        "brand_name": "Hi-Target",
        "serial_no": "110Jewx09",
        "condition": "new",
        "date_acquired": "2023-01-01",
        "supplier": "No holds barred Ltd"
        }
    }
    ```

- Delete an equipment (super_admin & admin only)
  Request : `DELETE` 
  URL : `http://127.0.0.1:3001/api/v1/equipments/:id`



  - List all bookings (super_admin & admin only)

  Request : `GET`
  URL : `http://127.0.0.1:3001/api/v1/bookings`


- Create new booking (super_admin & admin only)

  Request : `POST`
  URL : `http://127.0.0.1:3001/api/v1/bookings/`
  Body :
  ```json
    {
      "booking":{
          "user_id":2,
          "equipment_id":3,
          "booking_price":54000.00,
          "description":"GNSS Equipment leased out by admin 2",
          "status":"checkedOut",
          "pickup_date":"28-Jan-2023",
          "return_date":"5-Feb-2023",
          "booking_date":"10-Jan-2023"
      }
    }
    ```

- Update a booking (super_admin & admin only)
  Request : `PATCH` or `PUT`
  URL : `http://127.0.0.1:3001/api/v1/bookings/:id`
  Body :
  ```json
    {
      "booking":{
          "id": 1,
          "status": "returned",
          "booking_date": "2023-01-15",
          "description": "A Seiko brand GNSS Equipment",
          "pickup_date": "2023-01-31",
          "return_date": "2023-02-02",
          "booking_price": "34000.0",
          "user_id": 1,
          "equipment_id": 1
      }
    }
    ```

- Delete a booking (super_admin & admin only)
  Request : `DELETE` 
  URL : `http://127.0.0.1:3001/api/v1/bookings/:id`

- Note that you need to sign in as either `super_admin` or `admin` to use these endpoints on postman effectively.

## 👥 Author

👤 **Tunde Oretade**

- GitHub: [@tundeiness](https://github.com/tundeiness)
- LinkedIn: [tunde-oretade](https://www.linkedin.com/in/
tunde-oretade/)


## 🔭 Future Features

- [ ] Create an appropriate frontend using TypeScript and Reactjs

## 🤝 Contributing
Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## 📝 License

This project is [MIT](./LICENSE) licensed.

