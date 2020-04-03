class Deliverywayonbuyer < ActiveHash::Base
  self.data = [
      {id: 11, way: '未定'}, 
      {id: 12, way: 'クロネコヤマト'}, 
      {id: 13, way: 'ゆうパック'}, 
      {id: 14, way: 'ゆうメール'}, 
  ]
end