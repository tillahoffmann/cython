cdef extern from "<deque>" namespace "std" nogil:
    cdef cppclass deque[T,ALLOCATOR=*]:
        ctypedef T value_type
        ctypedef ALLOCATOR allocator_type

        # these should really be allocator_type.size_type and
        # allocator_type.difference_type to be true to the C++ definition
        # but cython doesn't support deferred access on template arguments
        ctypedef size_t size_type
        ctypedef ptrdiff_t difference_type

        cppclass iterator:
            T& operator*()
            iterator operator++()
            iterator operator--()
            iterator operator+(size_type)
            iterator operator-(size_type)
            difference_type operator-(iterator)
            bint operator==(iterator)
            bint operator!=(iterator)
            bint operator<(iterator)
            bint operator>(iterator)
            bint operator<=(iterator)
            bint operator>=(iterator)
        cppclass reverse_iterator:
            T& operator*()
            reverse_iterator operator++()
            reverse_iterator operator--()
            reverse_iterator operator+(size_type)
            reverse_iterator operator-(size_type)
            difference_type operator-(reverse_iterator)
            bint operator==(reverse_iterator)
            bint operator!=(reverse_iterator)
            bint operator<(reverse_iterator)
            bint operator>(reverse_iterator)
            bint operator<=(reverse_iterator)
            bint operator>=(reverse_iterator)
        cppclass const_iterator(iterator):
            pass
        cppclass const_reverse_iterator(reverse_iterator):
            pass
        deque() except +
        deque(deque&) except +
        deque(size_t) except +
        deque(size_t, T&) except +
        #deque[InputIt](InputIt, InputIt)
        T& operator[](size_t)
        #deque& operator=(deque&)
        bint operator==(deque&, deque&)
        bint operator!=(deque&, deque&)
        bint operator<(deque&, deque&)
        bint operator>(deque&, deque&)
        bint operator<=(deque&, deque&)
        bint operator>=(deque&, deque&)
        void assign(size_t, T&) except +
        void assign[InputIt](InputIt, InputIt) except +
        T& at(size_t) except +
        T& back()
        iterator begin()
        const_iterator const_begin "begin"()
        const_iterator cbegin()
        void clear()
        bint empty()
        iterator end()
        const_iterator const_end "end"()
        const_iterator cend()
        iterator erase(iterator) except +
        iterator erase(iterator, iterator) except +
        T& front()
        iterator insert(iterator, T&) except +
        void insert(iterator, size_t, T&) except +
        void insert[InputIt](iterator, InputIt, InputIt) except +
        size_t max_size()
        void pop_back()
        void pop_front()
        void push_back(T&) except +
        void push_front(T&) except +
        reverse_iterator rbegin()
        #const_reverse_iterator rbegin()
        const_reverse_iterator crbegin()
        reverse_iterator rend()
        #const_reverse_iterator rend()
        const_reverse_iterator crend()
        void resize(size_t) except +
        void resize(size_t, T&) except +
        size_t size()
        void swap(deque&)

        # C++11 methods
        void shrink_to_fit() except +
