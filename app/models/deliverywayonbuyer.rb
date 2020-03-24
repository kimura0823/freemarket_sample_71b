class Deliverywayonbuyer < ActiveHash::Base
  self.data = [
      {id: 1, way: '選択してください'}, 
      {id: 2, way: '未定'}, 
      {id: 3, way: 'クロネコヤマト'}, 
      {id: 4, way: 'ゆうパック'}, 
      {id: 5, way: 'ゆうメール'}, 
  ]
end