using System;
namespace Zona_Dыма_API.Elements
{
	public class User
	{
		public int id { get; set;}	
		public string mail { get; set; }
		public string phone { get; set; }
		public string userName { get; set; }
		public int bonus { get; set; }
		public int cashBack { get; set; }

		public User(int _id, string _mail, string _phone, string _userName, int _bonus, int _cashBack)
		{
			id = _id;
			mail = _mail;
			phone = _phone;
			userName = _userName;
			bonus = _bonus;
			cashBack = _cashBack;
		}
	}
}

