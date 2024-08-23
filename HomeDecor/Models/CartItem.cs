﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HomeDecor.Models
{
    public class CartItem
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl { get; set; }

        public decimal Subtotal
        {
            get { return Price * Quantity; }
        }
    }
}