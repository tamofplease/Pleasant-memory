import 'package:flutter/material.dart';
import 'package:meple/blocs/index/index.dart';
import 'package:meple/models/place.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PlaceTile extends StatelessWidget {

  final Place _place;
  final bool _selected;
  
  PlaceTile(this._place, this._selected);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<IndexBloc>(context).add(GetUserImage(Provider.of<String>(context)));
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: _selected ? Colors.white : Colors.white38,
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.star,
                    color: _place.been? Colors.yellow : _selected ? Colors.black : Colors.black45,
                  ),
                ),
                Expanded(
                  child: Text(
                    _place.name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _selected ? 17 : 10,
                      fontWeight: _selected ? FontWeight.w900 : FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                BlocBuilder<IndexBloc, IndexState>(
                  builder: (context, state) {
                    if(state is GottenUserImage) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: state.imageInfo,
                          backgroundColor: Colors.black26,
                        )
                      );
                    }
                    return CircularProgressIndicator();
                  }
                ),
              ],
            ),
          ),
          
        ],
      ),
      decoration: BoxDecoration(
        color: _selected ? Colors.white12 : Colors.white12,
        image: DecorationImage(
          colorFilter: _selected ? ColorFilter.mode(Colors.white12, BlendMode.dst) : ColorFilter.mode(Colors.grey[600], BlendMode.modulate),
          fit: BoxFit.cover,
          image: _place.images == null ? AssetImage(
            'assets/images/noimage.png',
          ) :
          NetworkImage(
            _place.images[0],
            //loadgin_builderを追加する。
          ),
        ),
        border: Border.all(
          color: _selected ? Colors.yellowAccent : Colors.white10,
          width: 10,
        ),
      ),
    );
  }
}

