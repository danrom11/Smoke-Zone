using System;
namespace Zona_Dыма_API.Elements
{
    public class TableBooking
    {
        public int id { get; set; }
        public bool booking { get; set; }

        public TableBooking(int _id, bool _booking)
        {
            id = _id;
            booking = _booking;
        }
    }
}

