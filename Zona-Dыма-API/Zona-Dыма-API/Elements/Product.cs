using System;
namespace Zona_Dыма_API.Elements
{
	public class Product
	{
		public int id { get; set; }
		public string title { get; set; }
		public string imageUrl { get; set; }
		public decimal price { get; set; }
		public string descript { get; set; }
		public string brand { get; set; }
		public string[] taste { get; set; }
		public int strong { get; set; }
		public int count { get; set; }

		public Product(int _id, string _title, string _imageUrl, decimal _price, string _descript, string _brand, string[] _taste, int _strong, int _count)
		{
			id = _id;
			title = _title;
			imageUrl = _imageUrl;
			price = _price;
			descript = _descript;
			brand = _brand;
			taste = _taste;
			strong = _strong;
			count = _count;
		}
	}
}

