# One to one

## Set up a new hibernate project
- create a new empty gradle project as for springboot
- add spring-boot-starter-data-jpa and spring-boot-starter-web and your database connector (mysql-connector-java) to the build.gradle
- create an application.properties file in the src/main/resources folder

```
spring.jpa.hibernate.ddl-auto=create
spring.datasource.url=jdbc:mysql://localhost:3306/db_example?useSSL\=false
spring.datasource.username=root
spring.datasource.password=simplonco
spring.datasource.driver-class-name=com.mysql.jdbc.Driver

logging.level.org.hibernate.SQL=DEBUG
logging.level.org.hibernate.type=TRACE
```

## A one ton one situation

![Main](img/Main.png)

## The model

```java
package oneToOne.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Users")
public class User implements Serializable {

	// default serial
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "UserID")
	private Long id;

	@NotNull
	@Size(max = 65)
	@Column(name = "Name")
	private String theName;

	@Size(max = 65)
	@Column(name = "Email")
	private String email;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(@NotNull @Size(max = 65) String name, @Size(max = 65) String email) {
		this.theName = name;
		this.email = email;
	}

}
```

>- [@Entity]( https://docs.oracle.com/javaee/7/tutorial/persistence-intro001.htm#BNBQA) : entity class will persist in database
- @Table : The additional annotation @Table is optional, but you can use it to specify a specific table name
- same with @Column and name
- The two annotations @Id and @GeneratedValue tell JPA that this value is the primary key for this table and that it should be generated automatically.

```java
package oneToOne.model;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;


@Entity
@Table(name = "Profiles")
public class Profile implements Serializable {

	private static final long serialVersionUID = 1L;

	public enum Gender {
		M,
		F
	}

	@Id
	@Column(name = "ProfileID")
	private Long id;

	@MapsId()
	@OneToOne(optional=true, cascade=CascadeType.REMOVE)
	@JoinColumn(name="ProfileID", unique=true, nullable=false, updatable=false)
    private User user;

	@Size(max = 255)
	@Column(name = "Address")
	private String address;

	@Column(name = "DateOfBirth")
	private LocalDate dateOfBirth;

	@Size(max = 10)
	@Column(name = "PhoneNumber")
	private String phoneNumber;

	@Enumerated(EnumType.STRING)
    @Column(length = 1)
    private Gender gender;

	public Profile() {
		// TODO Auto-generated constructor stub
	}

	public Profile(@Size(max = 255) String address1, LocalDate dateOfBirth,
			@Size(max = 10) String phoneNumber, Gender gender) {
		this.address = address1;
		this.dateOfBirth = dateOfBirth;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
	}

	public void setUser(User user) {
		this.user = user;
	}



}

```

## The repository

```java
package oneToOne.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import oneToOne.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

}

```
- This interface extends JpaRepository which provides **automagically** [all the convenient methods](https://docs.spring.io/spring-data/jpa/docs/current/api/org/springframework/data/jpa/repository/JpaRepository.html)
- Add the same for profiles :

```java
package oneToOne.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import oneToOne.model.Profile;


public interface ProfileRepository extends JpaRepository<Profile, Long> {

}

```

## The Application

```java
package oneToOne;


import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import oneToOne.model.Profile;
import oneToOne.model.Profile.Gender;
import oneToOne.model.User;
import oneToOne.repository.ProfileRepository;
import oneToOne.repository.UserRepository;



@SpringBootApplication
public class Application implements CommandLineRunner {

	@Autowired
	private UserRepository userRepository;

	@Autowired
    private ProfileRepository profileRepository;

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		// Clean up database tables
		profileRepository.deleteAllInBatch();
		userRepository.deleteAllInBatch();


		// Create a User instance
		User user1 = new User("toto", "toto@simplon.co");
		User user2 = new User("boubou", "boubou@simplon.co");

		// Create a UserProfile instance
		LocalDate dob = LocalDate.of(1980, 06, 01);
		Profile profile = new Profile(
				"55 rue de Vincennes, 93100 Montreuil",
				dob, "0636122523",Gender.M
			);

		profile.setUser(user1);


		// Save profile will also save user
		profileRepository.save(profile);

		// no profile, save user
		userRepository.save(user2);
		//=========================================
	}


}
```

## Questions

Une liste de questions à consulter et à enrichir dans session3-correction  
[questions.md](questions.md)
