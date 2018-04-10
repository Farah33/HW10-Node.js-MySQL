var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",
    port: 8889,
    user: "root",
    password: "root",
    database: "bamazon_db"
})

connection.connect(function(err) {
    if (err) throw (err);
    console.log("connection successful!");
    displayTable();
})

var displayTable = function() {
    connection.query("SELECT * FROM products", function(err, res) {
        for (var i = 0; i < res.length; i++) {
            console.log(res[i].itemID + " || " + res[i].product_name + " || " +
                res[i].department_name + " || " + res[i].price + " || " + res[i].stock_quantity + "\n");
        }
        promptCustomer(res);
    })
}

var promptCustomer = function(res) {
    inquirer.prompt([{
        type: "input",
        name: "choice",
        message: "What would you like to purchase?"
    }]).then(function(answer) {
        var correct = false;
        for (var i = 0; i < res.length; i++) {
            if (res[i].product_name == answer.choice) {
                correct = true;
                var product = answer.choice;
                var id = i;

                inquirer.prompt({
                    type: "input",
                    name: "amount",
                    message: "How many would you like to purchase?",
                }).then(function(answer) {
                    if ((res[id].stock_quantity - answer.amount) > 0) {
                        connection.query("UPDATE products SET stockQuantity=" + (res[id].stock_quantity - answer.amount) + "' WHERE productName='" + product + "'", function(err, res2) {
                            console.log("Item Purchased!");
                            displayTable();
                        })
                    } else {
                        console.log("Unavailable!");
                        promptCustomer(res);
                    }
                })
            }
        }
    })
}