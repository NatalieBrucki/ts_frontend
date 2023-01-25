class ApiConstants {
  static String baseUrl =
      //"http://192.168.0.139:8080"; // change to the IP the backend is running on - eileen
      //"http://172.16.1.55:8080"; // change to the IP the backend is running on - nat
      //"http://192.168.68.104:8080"; // change to the IP the backend is running on
  static String addUserEndpoint = "/addUser";
  static String getUsersEndpoint = "/getUsers";
  static String getUserByUsernameEndpoint = "/getUserbyUsername/{name}";
  static String getProjectsEndpoint = "/getProjects";
  static String addProjectEndpoint = "/addProject";
  static String getTimesheetsEndpoint = "/getTimesheets";
  static String getTimesheetsByUsernameEndpoint = "/getTimesheets/{username}";
  static String addTimesheetEndpoint = "/addTimesheet";
}
