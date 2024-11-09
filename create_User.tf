terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

provider "snowflake" {
  account  = "wo77656.ap-southeast-1"
  username = "SATISHPNL"
  password = "Satish@123"
  role     = "ACCOUNTADMIN"
}

variable "users" {
  type = map(object({
    login_name        = string
    password          = string
    email             = string
    first_name        = string
    last_name         = string
  }))
  default = {
    user_1 = {
      login_name  = "john_doe"
      password    = "password1"
      email       = "john.doe@example.com"
      first_name  = "John"
      last_name   = "Doe"
    }
    user_2 = {
      login_name  = "jane_smith"
      password    = "password2"
      email       = "jane.smith@example.com"
      first_name  = "Jane"
      last_name   = "Smith"
    }
    user_3 = {
      login_name  = "alice_jones"
      password    = "password3"
      email       = "alice.jones@example.com"
      first_name  = "Alice"
      last_name   = "Jones"
    }
    user_4 = {
      login_name  = "bob_brown"
      password    = "password4"
      email       = "bob.brown@example.com"
      first_name  = "Bob"
      last_name   = "Brown"
    }
    user_5 = {
      login_name  = "charlie_davis"
      password    = "password5"
      email       = "charlie.davis@example.com"
      first_name  = "Charlie"
      last_name   = "Davis"
    }
    user_6 = {
      login_name  = "diana_evans"
      password    = "password6"
      email       = "diana.evans@example.com"
      first_name  = "Diana"
      last_name   = "Evans"
    }
    user_7 = {
      login_name  = "frank_garcia"
      password    = "password7"
      email       = "frank.garcia@example.com"
      first_name  = "Frank"
      last_name   = "Garcia"
    }
    user_8 = {
      login_name  = "grace_harris"
      password    = "password8"
      email       = "grace.harris@example.com"
      first_name  = "Grace"
      last_name   = "Harris"
    }
    user_9 = {
      login_name  = "henry_lee"
      password    = "password9"
      email       = "henry.lee@example.com"
      first_name  = "Henry"
      last_name   = "Lee"
    }
    user_10 = {
      login_name  = "isabel_martin"
      password    = "password10"
      email       = "isabel.martin@example.com"
      first_name  = "Isabel"
      last_name   = "Martin"
    }
  }
}

resource "snowflake_user" "users" {
  for_each = var.users
  name               = each.key
  login_name         = each.value.login_name
  password           = each.value.password
  default_warehouse  = "COMPUTE_WH"
  default_role       = "USERADMIN"
  email              = each.value.email
  first_name         = each.value.first_name
  last_name          = each.value.last_name
  must_change_password = false
}
