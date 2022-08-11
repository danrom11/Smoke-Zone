using System;
using System.Net;
using System.Net.Mail;
using MySqlConnector;

namespace Zona_Dыма_API.Elements
{
	public static class UsersCommunication
	{
        static readonly DB db = new DB();
		public static string AddUser(string userName, string mail, string phone)
        {
			MySqlCommand command = new MySqlCommand("INSERT INTO `Users` (`id`, `mail`, `phone`, `userName`, `bonus`, `cashBack`) VALUES (NULL, @MAIL, @PHONE, @USERNAME, @BONUS, @CASHBACK)", db.getConnection());

			command.Parameters.Add("@MAIL", MySqlDbType.VarChar).Value = mail;
			command.Parameters.Add("@PHONE", MySqlDbType.VarChar).Value = phone;
			command.Parameters.Add("@USERNAME", MySqlDbType.VarChar).Value = userName;
			command.Parameters.Add("@BONUS", MySqlDbType.Int32).Value = 0;
			command.Parameters.Add("@CASHBACK", MySqlDbType.Int32).Value = 0;

			db.OpenConnection();
			if(command.ExecuteNonQuery() == 1)
            {
				Console.WriteLine("ADD USER");

				db.CloseConnection();
				return "USER ADD";
            }
			else
            {
				Console.WriteLine("ERROR USER");

				db.CloseConnection();
				return "USER ERROR";
			}
        }

		public static User InfoUser(string mail)
        {
			MySqlCommand command = new MySqlCommand("SELECT * FROM `Users`", db.getConnection());

			db.OpenConnection();

			using (MySqlDataReader reader = command.ExecuteReader())
            {
				while (reader.Read())
                {
					if(mail == reader.GetString("mail"))
                    {
						int id = reader.GetInt32("id");
						string phone = reader.GetString("phone");
						string userName = reader.GetString("userName");
						int bonus = reader.GetInt32("bonus");
						int cashBack = reader.GetInt32("cashBack");
						db.CloseConnection();
						return new User(id, mail, phone, userName, bonus, cashBack);
                    }
                }
            }
			db.CloseConnection();
			return new User(-1, "null", "null", "null", 0, 0);
		}


		public static User Login(string mail, string phone)
        {
			User user = InfoUser(mail);
			if (user.id != -1)
				return user;
			AddUser("Guest", mail, phone);
			return InfoUser(mail);
        }

		public static async void SendMail(string mail, string code)
        {
			MailAddress from = new MailAddress("Epifanov.den03@mail.ru", "Zona Dыма");
			MailAddress to = new MailAddress(mail);
			MailMessage m = new MailMessage(from, to);
			m.Subject = "Code";
			m.Body = "Your code: " + code;
			SmtpClient smtp = new SmtpClient("smtp.mail.ru", 587);
			smtp.Credentials = new NetworkCredential("Epifanov.den03@mail.ru", "xvK0Zpiu8xabTF384eDn");
			smtp.EnableSsl = true;
			await smtp.SendMailAsync(m);
		}

		public static User SetBonus(string mail, int bonus)
        {
			MySqlCommand command = new MySqlCommand("UPDATE `Users` SET `bonus` = @BONUS WHERE `Users`.`mail` = @MAIL", db.getConnection());
			command.Parameters.Add("@MAIL", MySqlDbType.VarChar).Value = mail;
			command.Parameters.Add("@BONUS", MySqlDbType.Int32).Value = bonus;

			 db.OpenConnection();

			if (command.ExecuteNonQuery() == 1)
			{
				db.CloseConnection();
				return InfoUser(mail);
			}
			else
            {
				db.CloseConnection();
				return new User(-1, "null", "null", "null", 0, 0);
			}
		}

		public static User SetUserName(string mail, string userName)
        {
			MySqlCommand command = new MySqlCommand("UPDATE `Users` SET `userName` = @USERNAME WHERE `Users`.`mail` = @MAIL", db.getConnection());
			command.Parameters.Add("@MAIL", MySqlDbType.VarChar).Value = mail;
			command.Parameters.Add("@USERNAME", MySqlDbType.VarChar).Value = userName;

			db.OpenConnection();

			if (command.ExecuteNonQuery() == 1)
			{
				db.CloseConnection();
				return InfoUser(mail);
			}
			else
			{
				db.CloseConnection();
				return new User(-1, "null", "null", "null", 0, 0);
			}
		}
	}
}

