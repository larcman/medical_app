class AddDefaultRecords < ActiveRecord::Migration[5.0]
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def change
    reversible do |dir|
      dir.up do
        Center.create id: '0',
                      code: 'CUCS',
                      name: 'Centro de Investigacion CUCS'
        
        User.create id: '0',
                    firstname: 'Admin',
                    lastname: 'Admin',
                    email: 'larcman@gmail.com',
                    username: 'admin',
                    isadmin: 't',
                    center_id: '0',
                    password_digest: User.digest('@dm!n')
                    
        Research.create id: '0',
                        code: 'PROTOCOLO',
                        name: 'Nombre Protocolo',
                        description: 'Alguna descripcion para esta protocolo',
                        user_id: '0',
                        center_id: '0'
      end
    end
  end
end
