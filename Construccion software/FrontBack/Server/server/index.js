//sever/index.js


const express = require("express");
const res = require("express/lib/response");
const fs = require("fs");
const newPet = {
    "pet4" : {
        "name" : "nala",
        "type" : "dog",
        "owner" : "eldelcesar",
        "color" : "salt-pepper",
        "id": 4
     }
}
const nePet = {
    "pet5" : {
        "name" : "lala",
        "type" : "cat",
        "owner" : "hector",
        "color" : "white",
        "id": 5
     }
}

const PORT = process.env.PORT || 3001;

const app = express();

app.get("/api", (req, res) => {
    res.json({message: "Hello from server!"}); 
});

app.get("/pets", (req, res) => {
    fs.readFile(__dirname + "/" + "pets.json", "utf8", (err, data) => {
        console.log(data);
        res.end(data);
    });
});

app.post("/addPet", (req, res) => {
    fs.readFile(__dirname + "/" + "pets.json", "utf8", (err, data) => {
        data = JSON.parse(data);
        data["pet4"] = newPet["pet4"];
        console.log(data);
        res.end(JSON.stringify(data));
    });
});

app.put("/putPet", (req, res) => {
    fs.readFile(__dirname + "/" + "pets.json", "utf8", (err, data) => {
        data = JSON.parse(data);
        data["pet5"] = nePet["pet5"];
        console.log(data);
        res.end(JSON.stringify(data));
    });
});

app.put("/putPetJSON", (req, res) => {
    fs.readFile(__dirname + "/" + "pets.json", "utf8", (err, data) => {
        data = JSON.parse(data);
        data["pet5"] = nePet["pet5"];
        console.log(data);
        res.end(JSON.stringify(data));
        fs.writeFile(__dirname + "/" + "pets.json", JSON.stringify(data), function(err){
            if (err) throw err;
        });
        res.end(JSON.stringify(data));
    });
});

app.post("/addPetJSON", (req, res) => {
    fs.readFile(__dirname + "/" + "pets.json", "utf8", (err, data) => {
        data = JSON.parse(data);
        data["pet4"] = newPet["pet4"];
        console.log(data);
        fs.writeFile(__dirname + "/" + "pets.json", JSON.stringify(data), function(err){
            if (err) throw err;
        });
        res.end(JSON.stringify(data));
    });
});

app.delete("/deletePet2", function (req, res) {
    // First read existing users.
    fs.readFile( __dirname + "/" + "pets.json", 'utf8', function (err, data) {
       data = JSON.parse(data);
       delete data["pet"+2];
       console.log( data );
       res.end( JSON.stringify(data));
    });
 });

app.delete("/deletePet2JSON", function (req, res) {
    // First read existing users.
    fs.readFile( __dirname + "/" + "pets.json", 'utf8', function (err, data) {
       data = JSON.parse(data);
       delete data["pet"+2];
       console.log( data );
       res.end( JSON.stringify(data));
       fs.writeFile(__dirname + "/" + "pets.json", JSON.stringify(data), function(err){
        if (err) throw err;
    });
    res.end(JSON.stringify(data));
    });
 })
app.listen(PORT, () => {
    console.log('Servidor lanzado con exito!');
});

 