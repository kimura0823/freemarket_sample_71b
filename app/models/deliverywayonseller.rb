class Deliverywayonseller < ActiveHash::Base
  self.data = [
      {id: 1, way: '未定'}, 
      {id: 2, way: 'らくらくメルカリ便'}, 
      {id: 3, way: 'ゆうメール'}, 
      {id: 4, way: 'レターパック'}, 
      {id: 5, way: '普通郵便(定形、定形外)'}, 
      {id: 6, way: 'クロネコヤマト'}, 
      {id: 7, way: 'ゆうパック'}, 
      {id: 8, way: 'クリックポスト'}, 
      {id: 9, way: 'ゆうパケット'}
  ]
end
