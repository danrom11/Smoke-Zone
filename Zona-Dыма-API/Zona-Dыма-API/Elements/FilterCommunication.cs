using System;
using MySqlConnector;
using System.Collections.Generic;

namespace Zona_Dыма_API.Elements
{
    public class FilterCommunication
    {
        DB db = new DB();


        public List<Filter> GetProducts(string type)
        {
            List<Filter> filters = new List<Filter>();
            MySqlCommand command = new MySqlCommand("SELECT * FROM `" + type + "Filters`", db.getConnection());

            db.OpenConnection();

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    filters.Add(new Filter(reader.GetInt32("id"), reader.GetString("title")));
                }

            }
            db.CloseConnection();
            return filters;
        }
    }
}

