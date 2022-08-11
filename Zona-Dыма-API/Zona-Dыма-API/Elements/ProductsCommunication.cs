using System;
using System.Collections.Generic;
using MySqlConnector;

namespace Zona_Dыма_API.Elements
{
	public class ProductsCommunication
	{
		DB db = new DB();


		public List<Product> GetProducts(string type)
        {
			List<Product> products = new List<Product>();
			MySqlCommand command = new MySqlCommand("SELECT * FROM `" + type + "`", db.getConnection());

			db.OpenConnection();

			using (MySqlDataReader reader = command.ExecuteReader())
			{
				while (reader.Read())
				{
                    products.Add(new Product(
                        reader.GetInt32("id"),
                        reader.GetString("title"),
						reader.GetString("imageUrl"),
						reader.GetDecimal("price"),
						reader.GetString("descript"),
						reader.GetString("brand"),
                        reader.GetString("taste").Split(";"),
                        reader.GetInt32("strong"),
						reader.GetInt32("count")
						));
                }
				
			}
			db.CloseConnection();
			return products;
		}
	}
}

