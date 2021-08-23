import 'package:flutter/material.dart';

class InputPage extends StatefulWidget
{
  @override
  _InputPage createState() => _InputPage();
}

class _InputPage extends State<InputPage>
{
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _selectedItem = 'Volar';

  List<String> _powers = ['Volar','Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputDateCntr = new TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput()
  {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${(_name == null)? 0 : _name.length}'),
        hintText: 'Nombre de la Persona',
        labelText: 'Nombre',
        helperText: 'Solo es el Nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value)
      {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson()
  {
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Poder: $_selectedItem'),
    );
  }

  Widget _createEmail()
  {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)
      ),
      onChanged: (value)
      {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword()
  {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock_open)
      ),
      onChanged: (value)
      {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createDate()
  {
    return TextField(
      controller: _inputDateCntr,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)
      ),
      onTap: ()
      {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate();
      },
    );
  }

  _selectDate() async
  {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate:  new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(picked != null)
    {
      setState(() {
        _date = picked.toString();
        _inputDateCntr.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getItemsDropdown()
  {
    List<DropdownMenuItem<String>> list = [];

    _powers.forEach((power)
    {
      list.add(
        DropdownMenuItem(
          child: Text(power),
          value: power,
        ),
      );
    });

    print(list);

    return list;
  }

  Widget _createDropdown()
  {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: _selectedItem,
          items: getItemsDropdown(),
          onChanged: (value){
            setState(() {
              _selectedItem = value;
            });
          },
        ),
      ],
    );
  }
}