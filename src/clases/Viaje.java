package clases;

public class Viaje {

	//atributos
	private int idViaje;
		private String carga;
		private String descarga;
		private int kilometraje;
		private java.sql.Date fecha;
		private String nota;
		
		
		private int idCombustible;
		private int idCmr;
		private int idConductor;
		
		//metodos
		public int getIdViaje() {
			return idViaje;
		}
		public void setIdViaje(int idViaje) {
			this.idViaje = idViaje;
		}
		public String getCarga() {
			return carga;
		}
		public void setCarga(String carga) {
			this.carga = carga;
		}
		public String getDescarga() {
			return descarga;
		}
		public void setDescarga(String descarga) {
			this.descarga = descarga;
		}
		public int getKilometraje() {
			return kilometraje;
		}
		public void setKilometraje(int kilometraje) {
			this.kilometraje = kilometraje;
		}
		public java.sql.Date getFecha() {
			return fecha;
		}
		public void setFecha(java.sql.Date fecha) {
			this.fecha = fecha;
		}
		public int getIdCombustible() {
			return idCombustible;
		}
		public void setIdCombustible(int idCombustible) {
			this.idCombustible = idCombustible;
		}
		public int getIdCmr() {
			return idCmr;
		}
		public void setIdCmr(int idCmr) {
			this.idCmr = idCmr;
		}
		@Override
		public String toString() {
			return "Viaje [idViaje=" + idViaje + ", carga=" + carga + ", descarga=" + descarga + ", kilometraje="
					+ kilometraje + ", fecha=" + fecha + ", idCombustible=" + idCombustible + ", idCmr=" + idCmr + "]";
		}
		public int getIdConductor() {
			return idConductor;
		}
		public void setIdConductor(int idConductor) {
			this.idConductor = idConductor;
		}
		public String getNota() {
			return nota;
		}
		public void setNota(String nota) {
			this.nota = nota;
		}
		
		
	
		
	
}
