let
  users = {
    alvivi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBZ8okBi9E5ZcD7Udx5YOhafqw9vJlgP3QFICKgqbzMI alvivi@gmail.com";
  };

  systems = {
    hiigara = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFsE+A6vIAkt0Dfu5BwLS733ykV4I0TZYgWvYwW/OG7K";
  };
in
{
  "aws_config.age".publicKeys = [ users.alvivi ];
}
