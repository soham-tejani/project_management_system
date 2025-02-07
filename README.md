# Project Conversation History

  This is a Ruby on Rails application built as a technical task for Homey. The app provides a conversation history for projects, including the ability to add comments and update project status. User authentication is handled by [Devise](https://github.com/heartcombo/devise).

  ## Features

  - **User Authentication:**  
    Users can sign up, log in, and update their profiles using Devise.

  - **Projects Module (CRUD):**  
    Authenticated users can create, view, edit, and delete projects. Each project is associated with a user.

  - **Comments:**  
    Users can add comments to a project. Comments are displayed on the project's show page and include the commenter's name and timestamp. Note that comments cannot be edited or deleted.

  - **Status Changes:**  
    Users can update the project status through a nested form on the project's show page. The status is stored as an integer with three possible values (pending, in_progress, completed) and the change is attributed to the user who made it.

  ## Getting Started

  ### Prerequisites

  - Ruby (version 3.0+ recommended)
  - Rails (version 6 or 7)
  - PostgreSQL (or another preferred database)

  ### Installation

  1. **Clone the repository:**

     ```bash
     git clone https://github.com/soham-tejani/project_management_system.git
     cd project_management_system
     ```

  2. **Install dependencies:**

     ```bash
     bundle install
     yarn install   # if you are using Yarn for JS dependencies
     ```

  3. **Set up the database:**

     ```bash
     rails db:create
     rails db:migrate
     ```

  5. **Start the Rails server:**

     ```bash
     bin/dev
     ```

  6. **Visit the app:**

     Open your browser and navigate to [http://localhost:3000](http://localhost:3000).

  ## Usage

  1. **Sign Up / Log In:**  
     Navigate to `/users/sign_up` to create a new account, or `/users/sign_in` to log in.

  2. **Projects:**  
     - From the landing page, click **View Projects** to see a list of your projects.
     - Click **New Project** to create a new project.
     - Click on a project title to view its details.

  3. **Project Details:**  
     On the project show page, you can:
     - Read the project description.
     - View comments and status change history.
     - Add a new comment.
     - Update the project status using the nested form.

  ## Customization

  - **Devise Views:**  
    The Devise views have been generated and can be modified in `app/views/devise`.

  - **Styling:**  
    Basic Bootstrap classes are used in the views. You can customize the styling by editing the corresponding CSS/SCSS files.

  ## Deployment

  For deployment, you can use platforms [Render](https://render.com/). Ensure that your production database settings are correctly configured.

  ## Contributing

  Contributions are welcome! Feel free to submit a pull request or open an issue if you encounter any problems.

  ## License

  This project is licensed under the [MIT License](LICENSE).

  ## Acknowledgments

  - [Devise](https://github.com/heartcombo/devise) for user authentication.
  - [Ruby on Rails](https://rubyonrails.org/) for providing a great framework to build this application.