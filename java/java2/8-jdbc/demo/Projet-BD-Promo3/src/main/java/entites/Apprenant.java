package entites;

import java.io.Serializable;
import java.util.Date;

public class Apprenant implements Serializable {
	private static final long serialVersionUID = 1L;

	private int idApprenant;
	private Date datenaissance;
	private String email;
	private String emailPro;
	private String nom;
	private String photo;
	private String prenom;
	private Region region;

	public Apprenant() {}

	public int getIdApprenant() {
		return this.idApprenant;
	}

	public void setIdApprenant(int idApprenant) {
		this.idApprenant = idApprenant;
	}

	public Date getDatenaissance() {
		return this.datenaissance;
	}

	public void setDatenaissance(Date datenaissance) {
		this.datenaissance = datenaissance;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailPro() {
		return this.emailPro;
	}

	public void setEmailPro(String emailPro) {
		this.emailPro = emailPro;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Region getRegion() {
		return this.region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return idApprenant +" "+ nom + " " + prenom;
	}
	

}