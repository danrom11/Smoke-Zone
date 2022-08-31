using System;
using System.Collections.Generic;
using MySqlConnector;

namespace Zona_Dыма_API.Elements
{
    public class TableBookingCommunication
    {
        DB db = new DB();

        public List<TableBooking> GetTableBookings()
        {
			List<TableBooking> tables = new List<TableBooking>();
			MySqlCommand command = new MySqlCommand("SELECT * FROM `Tables`", db.getConnection());

			db.OpenConnection();

			using (MySqlDataReader reader = command.ExecuteReader())
			{
				while (reader.Read())
				{
					
					tables.Add(new TableBooking(
						reader.GetInt32("id"),
						reader.GetBoolean("booking")
						));
				}

			}
			db.CloseConnection();
			//Console.WriteLine(tables.Count);
			return tables;
			//return tables.Count == 10 ? tables : new List<TableBooking> {
			//	new TableBooking(0, true), new TableBooking(1, true),
			//	new TableBooking(2, true), new TableBooking(3, true),
			//	new TableBooking(4, true), new TableBooking(5, true),
			//	new TableBooking(6, true), new TableBooking(7, true),
			//	new TableBooking(8, true), new TableBooking(9, true),
			//	new TableBooking(10, true)
			//};
		}
    }
}

