import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {	
		File file = new File("Log.txt");
		
		
		
    	
			
		//FileWriter fw= new FileWriter(file);
		//BufferedWriter bw= new BufferedWriter(fw);
	    Calendar cal = Calendar.getInstance();
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut success() : execution(* create*(..) );
	    after() : success() {
	    	System.out.println("**** User created desde log ****");
	    }
	    pointcut successtrans() : call(* moneyMake*(..) );
	    after() : successtrans() {
	    	System.out.println("**** Transaccion desde log ****");
	    	escribir("Deposito dinero--HORA: "+cal.getTime());
	    }
	    pointcut successtrans1() : call(* moneyWith*(..) );
	    after() : successtrans1() {
	    	System.out.println("**** Transacccion retirar desde log ****");
	    	escribir("Retiro dinero--HORA: "+cal.getTime());
	    }
	    

	    public void escribir(String msj){
	        try {

	            String str = msj;
	            
	            if (!file.exists()) {
	                file.createNewFile();
	            }

	            FileWriter fw = new FileWriter(file.getAbsoluteFile());
	            BufferedWriter bw = new BufferedWriter(fw);
	          
	            bw.append(str);
	            bw.close();

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
}  

