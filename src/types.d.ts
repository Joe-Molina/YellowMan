import { bombona_kg } from "./enums";

export interface Client {
  id: string;
  nombre: string;
  punto: string;
  fk_precios_venta: number;
}

export interface Clients {
  Clients: Client[];
}

export interface precios_bombona {
  id: number
  precio: number
  kg: bombona_kg
}


