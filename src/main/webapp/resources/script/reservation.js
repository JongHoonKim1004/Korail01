/**
 * 
 */

var reservationService = (function(){
  //insert
  function insert(reservation, callback, error){
    $.ajax({
      type: 'post',
      url: '/reservation/new',
      data: JSON.stringify(reservation),
      contentType: 'application/json; charset=urf-8',
      success: function(result, status, xhr){
        if(callback){
          callback(result);
        }
      },
      error: function(status, xhr, er){
        if(error){
          error(er);
        }
      }
    });
  }

  //getListByUserId
  function getListByUserId(user_id, callback, error){
    $.ajax({
      type: 'get',
      url: '/reservation/userID/' + user_id,
      success: function(result, status, xhr){
        if(callback){
          callback(result);
        }
      },
      error: function(status, xhr, er){
        if(error){
          error(er);
        }
      }
    });
  }

  //update
  function update(reservation, callback, error){
    $.ajax({
      type: 'put',
      url: '/reservation/' + reservation.rno,
      data: JSON.stringify(reservation),
      contentType: 'application/json; charset=urf-8',
      success: function(result, status, xhr){
        if(callback){
          callback(result);
        }
      },
      error: function(status, xhr, er){
        if(error){
          error(er);
        }
      }
    });
  }

  //delete
  function remove(rno, callback, error){
    $.ajax({
      type: 'delete',
      url: '/reservation/' + rno,
      success: function(result, status, xhr){
        if(callback){
          callback(result);
        }
      },
      error: function(status, xhr, er){
        if(error){
          error(er);
        }
      }
    });
  }

  //getOneByRno
  function getOneByRno(rno, callback, error){
    $.ajax({
      type: 'get',
      url: '/reservation/' + rno,
      success: function(result, status, xhr){
        if(callback){
          callback(result);
        }
      },
      error: function(status, xhr, er){
        if(error){
          error(er);
        }
      }
    });
  }

  //reservationSearch
  function reservationSearch(tno, callback, error){
    $.ajax({
      type: 'get',
      url: '/reservation/tno/' + tno,
      success: function(result, status, xhr){
        if(callback){
          callback(result);
        }
      },
      error: function(status, xhr, er){
        if(error){
          error(er);
        }
      }
    });
  }

  return {
    insert: insert,
    getListByUserId: getListByUserId,
    update: update,
    remove: remove,
    getOneByRno: getOneByRno,
    reservationSearch: reservationSearch
  }
})();