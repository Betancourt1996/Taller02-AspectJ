import java.io.File;
import java.util.Calendar;

public aspect Logger {	
    // Define a Pointcut is
    // collection of JoinPoint 
	// call say* of class HelloAspectJDemo.
   
	/*
	pointcut callSay(): call(* *.say*()); 
    before() : callSay() {
        System.out.println("Before call say");
    } 
    pointcut callBye(): call(* *.sayHello()); 
    after() : callBye()  {
        System.out.println("After call say");
    }  
    */
	
	
	

		File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    	System.out.println("**** User created desde log ****");
	    }
	    
	
}  

