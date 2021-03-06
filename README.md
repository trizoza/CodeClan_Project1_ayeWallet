# CodeClan_Project_1_ayeWallet
CodeClan Project1: Budgeting web app built in Ruby, PSQL, Sinatra, HTML and CSS

use case diagram: https://drive.google.com/file/d/0B7ijpS3yrR7lOHJHV0c0N1hmMkE/view?usp=sharing

object diagram: https://drive.google.com/file/d/0B7ijpS3yrR7lNjNxSzZWTTAyQzQ/view?usp=sharing

progress: https://trello.com/b/gRRoBRTq/ayewallet

## MoneyCashboard

You want to start tracking your spending in an attempt to be more frugal with money. You have decided to make a budgeting app to help you see where all of your money is being spent.

You must be able to create new Transactions ( which should include a merchant name, e.g. Tesco, and a value ) which have an associated Tag (e.g. 'food', 'clothes'). Your app would then be able to track a total, and display this in a view.

MVP:

- Create new transactions
- Display list of all transactions
- Display total amount spent
- Display total amount spent by tag

Possible Extensions:

- CRUD actions for the transactions
- Show a warning when the total expenditure is over budget (set a hard coded budget first)
- Add a date to the transactions and view total spending by month
- Any other ideas you might come up with

## To run follow:

In terminal:
- createdb aye_wallet
- psql -d aye_wallet -f db/aye_wallet.sql
- !!! (to quit pry)
- ruby db/seeds.rb
- ruby controller.rb

In browser:
- http://localhost:4567/

## Screenshots

![alt text](http://imgur.com/3zjHmoj.png)
![alt text](http://imgur.com/TlbDI1F.png)
![alt text](http://imgur.com/SeuZykr.png)
![alt text](http://imgur.com/V5txwEx.png)
![alt text](http://imgur.com/OirFdZS.png)
![alt text](http://imgur.com/HrERv73.png)
![alt text](http://imgur.com/9idYecH.png)

