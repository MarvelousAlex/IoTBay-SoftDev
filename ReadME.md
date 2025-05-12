1️⃣✅Landing (Home) Page
Acts as the entry point of the application.
Provides navigation options (e.g., “Login” and “Register”).

2️⃣✅Login Page
A JSP form for users to input credentials.
Submits (POST) data to the Welcome page.

3️⃣✅Register Page
A JSP form for new users to sign up.
Submits (POST) data to the Welcome page.

4️⃣✅Welcome Page
Retrieves user data from both the Login and Register pages.
Uses JavaBeans and sessions to store the user’s information.
Directs the user to the Main page once they are successfully logged in.

5️⃣✅Main Page
Retrieves the user Bean from the session and displays relevant details.
Provides a “Logout” link.

6️⃣✅Logout Page
Ends the session and redirects users back to the Main (or Landing) page.

7️⃣Initial Data Model
Implement JavaBeans (e.g., com.mycompany.beans.UserBean) to represent application data (e.g., user credentials, user profile info).
Store or pass these beans via sessions and requests as needed.
