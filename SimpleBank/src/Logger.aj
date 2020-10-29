import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
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
	    
	    pointcut deposito() : execution(* money*(..) );
	    after() : deposito() {
	    	System.out.println("**** Depositado ****");
	    	try {
	    	      FileWriter myWriter = new FileWriter(file,true);
	    	      myWriter.write("datos");
	    	      myWriter.write("\n");
	    	      myWriter.close();
	    	      //PrintWriter printWriter = new PrintWriter(myWriter);
	    	      //printWriter.println("algo");  //New line
	    	      //printWriter.close();
	    	      System.out.println("Successfully wrote to the file.");
	    	    } catch (IOException e) {
	    	      System.out.println("An error occurred.");
	    	      e.printStackTrace();
	    	    }
	    }
	
} 

