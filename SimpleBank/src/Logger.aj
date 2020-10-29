import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;

public aspect Logger {	
		File file = new File("log.txt");
		//if (!file.exists()) {
    		//file.createNewFile();
    	//}
    	
			
		//FileWriter fw= new FileWriter(file);
		//BufferedWriter bw= new BufferedWriter(fw);
	    Calendar cal = Calendar.getInstance();
	    
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    	
	    	System.out.println("**** User created desde log ****");
	    
	    }
	    pointcut successtrans() : call(* moneyMake*(..) );
	    after() : successtrans() {
	    	System.out.println("**** Transacction desde log ****");
	    	//bw.write("tipo de transacion: retirar dinero---HORA:"+cal);
	    }
	    pointcut successtrans1() : call(* moneyWith*(..) );
	    after() : successtrans1() {
	    	System.out.println("**** Transacction retirar desde log ****");
	    	//bw.write("tipo de transacion: retirar dinero---HORA:"+cal);
	    }
	    
	
}  

