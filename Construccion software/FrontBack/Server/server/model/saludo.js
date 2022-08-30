import mongoose from "mongoose"

const saludoSchema = mongoose.Schema({
    nombre: String,
    apodo: String,
})

export default mongoose.model("saludo",saludoSchema)


