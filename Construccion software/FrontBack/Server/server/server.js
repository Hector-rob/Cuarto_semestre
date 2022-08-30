import express from "express"
import mongoose from "mongoose"
import saludo from "./model/saludo.js"
const app = express(); //Line 2
app.use(express.json())
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization");
    next();
  });

const mongoURL = "mongodb+srv://HectorRob:Hrv2002.,.,@cluster0.wtlva.mongodb.net/BaseDeDatosWeb?retryWrites=true&w=majority"

mongoose.connect(mongoURL,{useNewUrlParser: true, useUnifiedTopology:true})

const saludo1 = {
    "saludo1" : {
        "de" : "Hector",
        "para" : "Paola",
        "cuerpo" : "Hola Paola",
        "estado" : "recibido",
        "id": 1
     }
}

const port = process.env.PORT || 5000; //Line 3

// This displays message that the server running and listening to specified port
app.listen(port, () => console.log(`Listening on port ${port}`)); //Line 6

// create a GET route
app.get('/verSaludos', (req, res) => {
  saludo.find({},(err,docs)=> {
      if(err){
          res.status(500).send(err)
      }
      else{
          res.status(200).send(docs)
      }
  })
});


app.post('/saludar', (req, res) => {
    let saludoData = req.body
    let mongoRecords = []
    saludoData.forEach(saludo => {
        mongoRecords.push({
            nombre: saludo.nombre,
            apodo: saludo.apodo
        })
    })
    saludo.create(mongoRecords, (err,records) => {
        if(err){
            res.status(500).send(err)
        }
        else{
            res.status(200).send(records)
        }
    })
});

app.post('/unSaludo', (req, res) => {
    const { nombre, apodo } = req.body;
    let mongoRecords = new saludo({nombre, apodo});
    saludo.create(mongoRecords, (err,records) => {
        if(err){
            res.status(500).send(err)
        }
        else{
            res.status(200).send(records)
        }
    })
});

app.delete("/borrarSaludos", (req, res) => {
    saludo.deleteMany({},(err) => {
        res.status(500).send(err)
    })
})