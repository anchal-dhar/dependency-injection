package coffee;

import dagger.Component;
import javax.inject.Singleton;

public class CoffeeApp {
  
  @Singleton
  @Component(modules = { DripCoffeeModule.class })
  public interface CoffeeShop {
    CoffeeMaker maker();
  }

  public static void main(String[] args) {
    System.out.println("Inside the Main!");
    CoffeeShop coffeeShop = DaggerCoffeeApp_CoffeeShop.builder().build();
    System.out.println("Inside the CoffeShop");
    coffeeShop.maker().brew();
    System.out.println("Brewing the coffee");
  }
}
