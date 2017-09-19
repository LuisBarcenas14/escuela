package model;

import java.util.ArrayList;
import java.util.List;

public class BeerExpert
{
    public List getBrands(String color)
    {
        List<String> brands = new ArrayList<>();
        if ( color.equals("light") )
        {
            brands.add("Jack Amber");
            brands.add("Red Moose");
        }
        else if (color.equals("dark"))
        {
            brands.add("Jail Pale Ale");
            brands.add("Gout Stout");
        }
        else if (color.equals("brown"))
        {
            brands.add("Gg");
            brands.add("Chocolate Beer");
        }
        else if (color.equals("red"))
        {
            brands.add("Ulala");
            brands.add("Blonde");
        }
        return (brands);
    }
}
