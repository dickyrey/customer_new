class AddressArgument {
  AddressArgument({
    required this.isEdit,
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.type,
    required this.street,
  });

  factory AddressArgument.empty() {
    return AddressArgument(
      isEdit: false,
      id: 0,
      name: '',
      phone: '',
      address: '',
      type: '',
      street: '',
    );
  }

  final bool isEdit;
  final int id;
  final String name;
  final String phone;
  final String address;
  final String type;
  final String street;
}
