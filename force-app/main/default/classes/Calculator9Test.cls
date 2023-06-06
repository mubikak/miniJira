@isTest
public  class Calculator9Test {
    @isTest
    public static void testMethod1() {
        Calculator9 c= new Calculator9();
        c.add(1.1, 8.5);
    }
    @isTest
    private static void testAddMethod(){
        Calculator9 c = new Calculator9();
        integer sum = c.add(5, 5);
        system.assertEquals(10, sum);
        Assert.areEqual(10, sum);
    }
    @isTest
    private static void testAddMethod2(){
        Calculator9 c = new Calculator9();
        integer sum = c.add(5, 5, 5);
        system.assertEquals(15, sum);
        Assert.areEqual(15, sum);
    }
    private static void leapYearCheck(){
        Calculator9 c = new Calculator9();
        Boolean b = c.leapYearCheck(date.today());
        system.assert(!b);
        Assert.isFalse(b);
        Assert.isTrue(!b);
        system.assertEquals(false, b);
        Assert.areEqual(false, b);
    }
}